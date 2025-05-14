# Bluetooth-Controlled Car using 8051 Microcontroller

This project demonstrates how to control a robotic car wirelessly using a **Bluetooth module (HC-05)** and an **8051 microcontroller (AT89C51)**. Commands sent from a smartphone are received over UART and translated into motor movements via the **L293D motor driver**.

---

## 📦 Project Summary

- **Title**: Bluetooth-Controlled Robotic Car using 8051
- **Platform**: AT89C51 Microcontroller
- **Interface**: HC-05 Bluetooth Module
- **Submitted by**: Neha Golani (22BEC042)
- **Guides**: Dr. Jayesh Patel, Purvi Patel
- **Department**: ECE, Nirma University
- **Course**: 2EC701 - Microcontroller and Interfacing

---

## ⚙️ Features

- 🔄 Real-time direction control (Forward, Backward, Left, Right, Stop)
- 📶 Wireless communication via HC-05 module
- 🔧 Modular code structure for easy debugging and customization
- 🚗 Dual DC motor control using L293D driver IC

---

## 🧠 Working Principle

1. The **Bluetooth module** receives characters ('F', 'B', 'L', 'R', 'S') from a mobile app.
2. These commands are transmitted via UART to the 8051.
3. The microcontroller interprets each command and sets the motor control pins accordingly.
4. The **L293D driver** receives these signals and drives the DC motors to move the car.

---

## 💻 Code Summary

### Command Mappings

| Command | Motor 1  | Motor 2  | Action         |
|---------|----------|----------|----------------|
| 'F'     | Forward  | Forward  | Move Forward   |
| 'B'     | Backward | Backward | Move Backward  |
| 'L'     | Backward | Forward  | Turn Left      |
| 'R'     | Forward  | Backward | Turn Right     |
| 'S'     | Off      | Off      | Stop           |

### Functional Blocks

- **`motor_forward()`**: Drives both motors forward
- **`motor_backward()`**: Drives both motors backward
- **`motor_left()` / `motor_right()`**: Executes turn via short delay and motor halt
- **`motor_stop()`**: Halts both motors
- **`bluetooth_init()`**: Initializes UART settings for 9600 baud

---

## 🔩 Components Used

- AT89C51 Microcontroller
- L293D Motor Driver IC
- HC-05 Bluetooth Module
- Crystal Oscillator (11.0592 MHz)
- Two DC Motors and Wheels
- Power Supply

---

## 🧪 Testing & Output

- Commands were sent from a Bluetooth terminal app installed on a smartphone.
- The car responded accurately to direction commands.
- Motor control logic was verified through behavior on ground testing.

---

## 🧾 Applications

- Basic robotics and automation
- Bluetooth-controlled vehicles and drones
- Educational projects for learning microcontroller interfacing
- Foundation for advanced robotics: line following, obstacle avoidance, etc.

---

## 🔮 Future Enhancements

- Add **obstacle detection sensors**
- Integrate **line-following capability**
- Implement **voice control**
- Expand to support **joystick or gesture-based control**

---

## 📚 References

1. Circuit Digest: Android controlled robot using 8051 microcontroller  
2. AT89C51 Datasheet  
3. L293D Datasheet  
4. The 8051 Microcontroller and Embedded Systems – Muhammad Ali Mazidi et al.

---

## 📄 License

This project is licensed under the MIT License.

