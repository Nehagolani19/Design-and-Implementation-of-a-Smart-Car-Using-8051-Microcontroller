#include <reg51.h>     // Include 8051 header file (to specify values of )

sbit IN1 = P2^0;        // Motor 1 control pin 1 (L293D)
sbit IN2 = P2^1;        // Motor 1 control pin 2 (L293D)
sbit IN3 = P2^2;        // Motor 2 control pin 1 (L293D)
sbit IN4 = P2^3;        // Motor 2 control pin 2 (L293D)

unsigned char ch;       // Variable to store received Bluetooth character

void delay(unsigned int ms) {
    unsigned int i, j;
    for (i = 0; i < ms; i++) {
        for (j = 0; j < 1000; j++); // a single loop generates 1ms delay
    }
}

void motor_forward() {
    IN1 = 1;
    IN2 = 0;
    IN3 = 1;
    IN4 = 0;
}

void motor_backward() {
    IN1 = 0;
    IN2 = 1;
    IN3 = 0;
    IN4 = 1;
}

void motor_left() {
    motor_forward();  // Move forward to initiate turn
    delay(200);        // Short delay to start turn
    IN3 = 0;            // Stop right motor
}

void motor_right() {
    motor_forward();  // Move forward to initiate turn
    delay(200);        // Short delay to start turn
    IN1 = 0;            // Stop left motor
}

void motor_stop() {
    IN1 = 0;
    IN2 = 0;
    IN3 = 0;
    IN4 = 0;
}

void bluetooth_init() {
    // Set values of special function registers required for bluetooth communication
    SCON = 0x50;      // Serial mode 1,  REN=1
    TH1 = 0xFD;       // Set baud rate at 9600 (to adjust with bluetooth module hc-05)
    TMOD = 0x20;
    TR1 = 1;          // Enable serial communication
}

void main() {
    bluetooth_init();  // Initialize Bluetooth module

    while (1) {
        ch = SBUF;       // Read received character
        switch (ch) {
            case 'F':
                motor_forward();
                break;
            case 'B':
                motor_backward();
                break;
            case 'L':
                motor_left();
                break;
            case 'R':
                motor_right();
                break;
            case 'S':
            default:
                motor_stop();
                break;
        }
    }
}
