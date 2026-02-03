---
title: "Self-Balancing Platform using Model Predictive Control"
excerpt: "<img src='/images/projects/ball-balancer/platform.jpg' style='width:400px;'><br>Designed and built a self-balancing ball platform and implemented Model Predictive Control in embedded C to autonomously balance a steel ball on a tilting surface"
collection: portfolio
date: 2026-01-27 00:00:00
last_modified_at: 2026-02-02 00:00:00
mathjax: true
---

![Platform](/images/projects/ball-balancer/platform.jpg)\
Figure 1. The completed self-balancing ball platform with capacitive touch sensing and servo-driven tilt control

**Key Features:**
- Designed and built a 2-DOF platform capable of balancing a steel ball at any position on an 8.4" capacitive touch surface
- Implemented Model Predictive Control (MPC) algorithm in embedded C on an ESP32 microcontroller
- Integrated Kalman filtering for state estimation from noisy touch sensor measurements
- Achieved real-time control at 50ms sampling intervals with pre-computed gain matrices

**Technologies Used:**
- ESP32 S2 Feather microcontroller
- Fusion 360 for CAD design
- Python (NumPy) for MPC formulation and gain matrix computation
- C programming for embedded implementation
- Kalman filtering for state estimation

**Results:**
- Successfully demonstrated finite-horizon optimal control with Model Predictive Control
- Platform autonomously balances a 1" steel ball at commanded positions
- System operates reliably with 4 states, 2 inputs, and a 2-DOF mechanical design

<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden;">
  <video style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" controls preload="metadata">
    <source src="/images/projects/ball-balancer/mpc-results.mp4" type="video/mp4">
  </video>
</div>

<br>

# Background

For my graduate controls class, I designed and built both the hardware and software for a self-balancing ball platform. While ball-on-plate systems are commonly implemented using PID control, our class focused on Model Predictive Control (MPC)—a finite-horizon optimal control technique that predicts future system behavior and optimizes control inputs accordingly.

The system consists of a tilting platform that uses servo motors to adjust its orientation along two axes. A capacitive touch panel tracks the ball's position, and the controller calculates the optimal servo angles to move the ball to a desired location or maintain it at a setpoint.

The project challenged me to integrate mechanical design, embedded programming, control theory, and real-time state estimation into a single functioning system. The project took approximately 3 months to complete, from initial design through testing and optimization.

# Design

## Hardware Architecture

![CAD Assembly](/images/projects/ball-balancer/cad-assembly.png)\
Figure 2. CAD assembly showing the mechanical design and component layout

The mechanical system was designed to provide precise, repeatable motion while maintaining structural rigidity. The overall construction consists of several key subsystems:

**Base Platform:**
- 1/2" thick wood base for structural support
- Provides mounting points for servo motors and acts as a stable reference frame

**3D Printed Components:**
- Motor mounts to securely hold servo motors at the correct angles
- Plate bracket to connect the capacitive touch panel to the universal joint
- Pillow block bearings for smooth rotational motion
- Plate clamps to secure the touch panel without damaging it
- Custom standoff for the central universal joint connection

**Purchased Components:**
- Two high-torque digital servo motors for platform actuation
- Adafruit ESP32 S2 Feather microcontroller for control implementation
- 1" steel bearing ball (approximately 67g mass)
- 8.4" four-wire resistive capacitive touch panel for position sensing
- Ball joint rod ends to connect servos to the platform
- Hex standoffs and fasteners for assembly

I chose an Adafruit ESP32 S2 Feather as the microcontroller because it offered sufficient processing power for real-time MPC calculations, built-in WiFi for debugging and data logging, and plenty of GPIO pins for the servos and touch panel. The ESP32's dual-core architecture also allowed me to potentially separate sensor reading and control computation in future iterations.

## Mechanical Design Considerations

The two-motor configuration was a deliberate choice to constrain the system to exactly 2 degrees of freedom. This setup allows the plate to tilt along the XZ and YZ planes independently. By restricting the DOF to 2, I ensured there would be only one mathematically possible solution when the controller attempts to move the ball to any specific location on the platform. This significantly simplified the inverse kinematics and control problem.

The four-wire capacitive touch panel continuously measures the x and y coordinates of the ball's contact point. The two servo motors adjust the platform's tilt angles \\(\theta_x\\) and \\(\theta_y\\), which cause the ball to roll according to the gravitational component along the tilted surface.

One challenge I encountered during assembly was ensuring the touch panel remained flat and properly tensioned. Any warping or looseness in the panel led to inconsistent position readings, which degraded control performance. I solved this by designing custom clamps that distributed pressure evenly around the panel's perimeter.

## Dynamics Equations and Model Predictive Control

To implement MPC, I first needed to derive a mathematical model of the system. The ball's motion on the tilted platform can be described by Newton's second law, with the following simplifying assumptions:

**Modeling Assumptions:**
- Negligible rolling friction between ball and platform
- Wind resistance is negligible at the slow speeds involved
- Changes in plate tilt occur slowly relative to ball dynamics
- Normal force remains approximately constant (no significant vertical acceleration)
- Small angle approximation (\\(\sin\theta \approx \theta\\), \\(\cos\theta \approx 1\\))

Under these assumptions, the ball's acceleration in the x and y directions is proportional to the platform's tilt angles:

$$\ddot{x} = g \sin(\theta_x) \approx g \theta_x$$

$$\ddot{y} = g \sin(\theta_y) \approx g \theta_y$$

where \\(g\\) is the gravitational acceleration (9.81 m/s²), and \\(\theta_x\\), \\(\theta_y\\) are the platform tilt angles in radians.

This gives us a system with 4 states: \\([x, \dot{x}, y, \dot{y}]\\) (position and velocity in both directions) and 2 control inputs: \\([\theta_x, \theta_y]\\) (the commanded tilt angles).

The state-space representation can be written as:

$$\dot{x} = Ax + Bu$$

where:

$$x = \begin{bmatrix} x \\ \dot{x} \\ y \\ \dot{y} \end{bmatrix}, \quad u = \begin{bmatrix} \theta_x \\ \theta_y \end{bmatrix}$$

$$A = \begin{bmatrix} 0 & 1 & 0 & 0 \\ 0 & 0 & 0 & 0 \\ 0 & 0 & 0 & 1 \\ 0 & 0 & 0 & 0 \end{bmatrix}, \quad B = \begin{bmatrix} 0 & 0 \\ g & 0 \\ 0 & 0 \\ 0 & g \end{bmatrix}$$

### Model Predictive Control Formulation

Model Predictive Control solves an optimization problem at each time step to determine the best control inputs over a finite future horizon. The controller predicts the system's future behavior and selects inputs that minimize a cost function while respecting constraints.

The MPC optimization problem is:

$$\min_{u_0, \ldots, u_{N-1}} \sum_{k=0}^{N-1} \left( x_k^T Q x_k + u_k^T R u_k \right) + x_N^T Q_f x_N$$

subject to:
$$x_{k+1} = Ax_k + Bu_k$$

where:
- \\(N\\) is the prediction horizon (I used \\(N = 20\\) time steps, chosen so the ESP32 could calculate the control law fast enough for real-time operation)
- \\(Q\\) is the state cost matrix (penalizes deviation from the setpoint)
- \\(R\\) is the control cost matrix (penalizes large control inputs)
- \\(Q_f\\) is the terminal cost matrix (penalizes final state error)

### Cost Function Design

The cost function balances multiple objectives:

1. **Output tracking:** The \\(\Psi\\) matrix penalizes deviations from the desired ball position. I used a simple scalar weight (\\(\psi_y = 1.0\\)) applied to both x and y position errors. Note that only position is penalized in the cost function—velocity estimates from the Kalman filter are used for state feedback but not directly penalized in the MPC objective.

2. **Control effort:** The \\(\Lambda\\) matrix penalizes input increments \\(\Delta u\\) (changes in servo angles) rather than absolute angles. This prevents aggressive tilting that could cause the ball to roll off the platform or create chattering. I used axis-specific penalties (\\(\lambda_{\phi} = 0.5\\), \\(\lambda_{\theta} = 0.5\\)) to allow independent tuning of each servo's aggressiveness.

I tuned these cost parameters experimentally through direct hardware testing rather than simulation. The tuning process involved adjusting the output tracking weight (\\(\psi_y\\)) and input increment penalties (\\(\lambda_{\phi}\\), \\(\lambda_{\theta}\\)) until the system exhibited smooth, stable tracking without oscillation. The relatively long prediction horizon (\\(N = 40\\)) with shorter control horizon (\\(N_u = 5\\)) provided sufficient look-ahead for smooth trajectory planning without requiring an explicit terminal cost.

## Software Implementation

Implementing MPC on a resource-constrained microcontroller required careful optimization. Solving the full MPC optimization problem in real-time would be computationally infeasible on an ESP32, so I used an offline-online approach.

### Offline Computation (Python)

I used Python with NumPy to:
1. Define the system matrices \\(A\\) and \\(B\\)
2. Discretize the continuous-time model using Forward Euler with \(\Delta t = 0.05\) seconds
3. Build the prediction matrix \(\Phi\) that maps input increment sequences to future output trajectories
4. Formulate the cost function matrices \(\Psi_{big}\) (output tracking) and \(\Lambda_{big}\) (input increment penalties)
5. Solve for the optimal gain matrix \(K\) by computing \(K = (\Phi^T\Psi\Phi + \Lambda)^{-1}\Phi^T\Psi\) and extracting the first-move gain
6. Generate a C header file containing the pre-computed gain matrix as a constant array

For a linear system like this one, the MPC solution can be pre-computed as an output-feedback gain matrix operating on predicted tracking errors. This converts the optimization problem into a simple matrix multiplication that the microcontroller can execute quickly.

The control law uses incremental inputs:
$$\Delta u_k = K \cdot E$$
$$u_k = u_{k-1} + \Delta u_k$$

where \(E\) is the stacked vector of output tracking errors (predicted position errors over the horizon \(H\)), and \(K\) is a \((2 \times 80)\) gain matrix that maps from 40 future output errors (2 outputs × 40 time steps) to the 2 input increments.

### Online Computation (ESP32 in C)

The embedded C code running on the ESP32 performs the following tasks in each control loop:

1. **Sensor Reading:** Query the capacitive touch panel to get the ball's x and y positions
2. **State Estimation:** Apply a Kalman filter to estimate the full state (including velocities) from noisy position measurements
3. **Free Response Prediction:** Compute the predicted output trajectory \(Y_{free}\) assuming the servo angles remain constant
4. **Control Calculation:** Compute output tracking errors \(E = R - Y_{free}\) and multiply by the pre-computed gain matrix to get \(\Delta u_k\)
5. **Input Integration:** Update servo angles as \(u_k = u_{k-1} + \Delta u_k\)
6. **Servo Actuation:** Send PWM signals to position the servos at the calculated angles

### Kalman Filter for State Estimation

Since the capacitive touch panel only measures position (not velocity), I implemented a Kalman filter in C on the ESP32 to estimate the full 4-state vector from the noisy 2-measurement vector.

The Kalman filter recursively estimates the state using a model of the system dynamics and the measurement noise characteristics. This provides smooth velocity estimates even when position measurements are noisy or occasionally drop out. I also implemented outlier rejection using Mahalanobis distance to detect and reject physically impossible measurements (like when the sensor temporarily loses contact with the ball).

The measurement model is:
$$z_k = Cx_k + v_k$$

where:
$$C = \begin{bmatrix} 1 & 0 & 0 & 0 \\ 0 & 0 & 1 & 0 \end{bmatrix}$$

and \\(v_k\\) is zero-mean Gaussian measurement noise.

I tuned the process noise covariance \\(Q_{kf}\\) and measurement noise covariance \\(R_{kf}\\) empirically by observing the filter's performance. Too much trust in the model led to sluggish velocity estimates, while too much trust in measurements caused jittery estimates from sensor noise.

### Timing and Execution

I chose a sampling period of 50ms (\\(\Delta t = 0.05\\) s) based on several factors:

- The servo motors have finite slew rates and cannot respond faster than about 20-30ms
- The touch panel's I2C communication takes approximately 5-10ms per reading
- The ESP32 needed time to execute the Kalman filter and control calculations
- The ball's dynamics are relatively slow compared to the control loop

At 20 Hz update rate, the system had enough time to execute all computations with margin for occasional delays or communication errors.

# Results

The platform successfully balanced the ball and demonstrated the effectiveness of Model Predictive Control for this application.

![position vs. reference](/images/projects/ball-balancer/results.png)\
Figure 3. Measured ball position (x, y) versus reference (\\(x_{ref}\\), \\(y_{ref}\\)), and control inputs \\(u\\)

I validated the MPC controller by commanding it to track two reference points: (40, 40) mm and (-20, -20) mm, with the origin at the center of the platform. The controller switched between these setpoints every 7 seconds to test both tracking performance and transient response.

The controller performed well overall, successfully driving the ball to the desired locations with reasonable accuracy. The algorithm reacted appropriately to reference changes, and the linearized model proved sufficient for controlling the system despite its simplifications.

One significant challenge visible in the data is the occurrence of false positive touches from the capacitive sensor. These appear as large spikes in the measured x and y positions, most prominently between t=15-20s. Without proper filtering, these erroneous readings would cause the controller to command aggressive tilting maneuvers, often throwing the ball out of bounds and destabilizing the system.

The Kalman filter's outlier rejection mechanism proved essential for robust operation. By implementing Mahalanobis distance-based gating, the filter could identify and reject physically impossible measurements—such as when the sensor momentarily reported the ball teleporting across the platform. This allowed the controller to maintain an accurate state estimate and continue stable operation even when the sensor produced bad data.

Key performance metrics:

- **Settling time:** Approximately 2-3 seconds to reach a new setpoint from rest
- **Steady-state error:** Less than 5mm from the target position under nominal conditions
- **Stability:** System remained stable for extended periods without oscillation or drift
- **Robustness:** Could handle gentle external disturbances (light pushes on the platform) and sensor outliers

The MPC approach showed clear advantages over a naive PID implementation:
- Predictive behavior prevented overshoot when approaching targets
- The finite-horizon optimization naturally handled constraints on servo angles
- State-space formulation made multi-input-multi-output control straightforward

# Takeaways

This project reinforced several important lessons about control systems and embedded implementation:

**1. Translating classroom theory to hardware reveals practical constraints**

In class, we studied advanced MPC techniques including nonlinear formulations, adaptive gain scheduling, and robust control methods. However, implementing MPC on real hardware quickly revealed the gap between theory and practice. My simplified linearized model worked well because the key assumptions (small angles, negligible friction) held true in the operating range I designed for. The experience taught me that a reasonable model paired with proper system design (constraining DOF, operating within linear regions) can make sophisticated control algorithms practically viable. Understanding which theoretical tools to deploy versus which to defer was a crucial skill developed through this project.

**2. Pre-computation is essential for real-time MPC**

Computing the full QP solution online would have been impossible. The offline gain matrix approach made MPC practical on a microcontroller.

**3. Real world systems have noisy data that require filtering**

The Kalman filter transformed noisy, discontinuous position measurements into smooth, reliable state estimates. This was crucial for stable control. In class we assumed the data regarding position, velocity, etc of a system is accurate however in many real-world systems sensor fusion, redundancy, and stochastic filtering should be applied.

**4. Tuning is an iterative process.**

Finding good cost matrices and filter parameters required extensive experimentation directly on hardware. Without simulation, I had to tune carefully by observing the physical system's behavior and adjusting parameters incrementally.

# Future Improvements

Given more time, I would make several enhancements:

**Trajectory tracking:** Extend the system to follow pre-planned trajectories rather than just setpoint regulation. This would demonstrate MPC's ability to handle time-varying references.

**Nonlinear MPC:** Implement a nonlinear model that accounts for finite tilt angles and rolling friction, enabling more aggressive maneuvers.

**Adaptive control:** Add online parameter estimation to adapt to changes in ball mass or surface friction without re-tuning.

**Camera Challenge:** Replace the capacitive touch panel with a camera-based vision system. Real time computer vision for position tracking is extremely challenging to do but is the hallmark of physical intelligence in robotics and self driving.

Overall, this project successfully demonstrated that Model Predictive Control can be implemented on resource-constrained embedded systems through careful offline computation and efficient online execution. The combination of theoretical control design and practical hardware implementation made this one of the most rewarding projects in my graduate studies.