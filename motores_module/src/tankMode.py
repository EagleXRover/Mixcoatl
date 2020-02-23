#!/usr/bin/env python

from sys import exit
import rospy
import os
import time

from roboclaw import Roboclaw

class tank:
    def __init__(self,port,baud,pwmLimit,motorsID): #"""INICIALIZADOR"""
        self.pord = port            ### PUERTO AL QUE ESTA CONECTADO ###
        self.brte = baud            ### VELOCIDAD DE BAUDRATE DEL DRIVER ###
        self.pwml = pwmLimit        ### LIMITE MAXIMO DEL PWM (102) ###
        self.msID = motorsID        ### LISTA DE ID'S DE LOS DRIVERS DE MOTORES ###
        self.rccm = self.createRC(port,baud)    ### CREAR CONTROL DRIVER ###
        self.open()                             ### ABRIR COMUNICACION SERIAL ###
        self.resetEnc(motorsID)                 ### REINICIAR VALORES ENCODER DRIVER ###
        self.setTo0Treshold = 0.05              ### RANGO DE ERROR DE 0 ###
        self.prevPWM = [0,0,0,0,0,0]            ### ALMACENA EL VALOR ANTERIOR DEL PWM ###
        self.serialDelay = 0.01                 ### DELAY(?) ###

    def tankDrive(self,joy):    #"""CONTROLADOR DE LAS LLANTAS"""
        # JOY.X: LADO IZQ.
        # JOY.Y: LADO DER.
        if joy.y > self.setTo0Treshold:
            self.goForward('right',self.fixPwm(joy.y))
        elif joy.y < -self.setTo0Treshold:
            self.goBackward('right',self.fixPwm(-joy.y))
        else:
            self.setTo0('right')

        if joy.x > self.setTo0Treshold:
            #print("call forward L")
            self.goForward('left',self.fixPwm(joy.x))
        elif joy.x < -self.setTo0Treshold:
            #print("call backward L")
            self.goBackward('left',self.fixPwm(-joy.x))
        else:
            #print("call setTo0 L")
            self.setTo0('left')
       # speed = self.ReadSpeed(self.msID)
        return 0

    def open(self): #"""ABRIR COMUNICACION SERIAL"""
        for i in range(1):
            rospy.loginfo("waiting port: %s. %i sec." %(self.pord,10-i))
            time.sleep(1)
        else:
            rospy.loginfo("open port: %s" %self.pord)
            os.system("sudo chmod 777 /dev/" + self.pord)
            rospy.loginfo("port: %s opened" %self.pord)
        if self.rccm.Open():
            print(self.rccm._port)
        else: 
            exit("Error: cannot open port: " + self.pord)
    
    def createRC(self,port,baud):   #"""CREAR CONTROL DRIVER"""
        listrc = Roboclaw('/dev/' + port, baud)
        return listrc
    
    def PWMChanged(self, motor, pwm):   #"""VERIFICA SI CAMBIO EL PWM"""
        if pwm != self.prevPWM[motor]:
            self.prevPWM[motor] = pwm
            return True
        return False

    def goForward(self,side,pwm):   #"""HACE QUE LOS MOTORES POR LADO AVANCEN"""
        for i in range(3):
            if side == 'right' and self.PWMChanged(i, pwm):
                time.sleep(self.serialDelay)
                self.rccm.ForwardM1(self.msID[i],pwm)
            elif side == 'left' and self.PWMChanged(i+3, pwm):
                time.sleep(self.serialDelay)
                self.rccm.BackwardM1(self.msID[i+3],pwm)

    def goBackward(self,side,pwm):  #"""HACE QUE LOS MOTORES POR LADO RETROCEDAN"""
        for i in range(3):
            if side == 'right' and self.PWMChanged(i, -pwm):
                time.sleep(self.serialDelay)
                self.rccm.BackwardM1(self.msID[i],pwm)
            elif side == 'left' and self.PWMChanged(i+3, -pwm):
                time.sleep(self.serialDelay)
                self.rccm.ForwardM1(self.msID[i+3],pwm)
    
    def setTo0(self,side):  #"""HACE QUE LOS MOTORES POR LADO PAREN"""
        for i in range(3):
            if side == 'right' and self.PWMChanged(i, 0):
                time.sleep(self.serialDelay)
                self.rccm.ForwardM1(self.msID[i],0)
            elif side == 'left' and self.PWMChanged(i+3, 0):
                time.sleep(self.serialDelay)
                self.rccm.ForwardM1(self.msID[i+3],0)

    def fixPwm(self,percentage): #"""CONVIERTE EL VALOR DE PORCENTAJE A PWM (ESCALA DE 0-1 A 0-102) CON REDONDEO A 2 DECIMALES"""
        return long(round(percentage*self.pwml,2))

    def resetEnc(self,idS): #"""REINICIAR VALORES ENCODER DRIVER"""
        for i in range(6):
            self.rccm.ResetEncoders(idS[i])
    
    def ReadSpeed(self,idS): #"""LEE VELOCIDAD(?)"""
        speed = []
        for i in range (6):
            if i%2 == 0:
                speed[i*2] = idS[i]
            else:
                speed[i*2+1] = self.rccm.ReadSpeedM1(idS[i])
        return speed
