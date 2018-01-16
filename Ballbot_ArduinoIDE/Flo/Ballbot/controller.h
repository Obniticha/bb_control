#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <Define.h>
#include <IMU.h>
#include <imu_spi.h>
#include <MadgwickAHRS.h>
#include <MPU9250.h>
#include <MPU9250_REGS.h>

#include "ballbot_motor_driver.h"

<<<<<<< HEAD
#define SAMPLE_TIME 40000      // in microseconds
=======
<<<<<<< HEAD
#define SAMPL_TIME  100000      // in microseconds

#define A_PBZ       -2.660
#define K_MOTOR     658.3092  // Current unit per Nm

=======
#define SAMPLE_TIME  40000      // in microseconds
>>>>>>> 23c8c4f751b4403b2de96f3de320f5220ba3cd81
#define T1          SAMPLE_TIME/2
#define TR          10*T1
#define K_PD        10       

#define B0          (TR/SAMPLE_TIME)*K_PD
#define B1          (-1-(2*TR/SAMPLE_TIME))*K_PD
#define B2          (1+TR/SAMPLE_TIME)*K_PD

//#define K_MOTOR    658.3092  // Current unit per Nm
#define K_EXP        7 // torque to unit factor 11.11 (Michi)
>>>>>>> 308ed102275a4d833007e360641dd4ba1d51ad69

#define ALPHA       PI/4
#define BETA        PI/3
#define RK          0.07
#define RW          0.03

<<<<<<< HEAD:Ballbot_ArduinoIDE/Flo/Ballbot/controller.h
#define FAKT        0.7
=======
<<<<<<< HEAD
#define DEBUG_SEN
=======
#define FAKT        3
>>>>>>> 8adc06109c7df4cc933f4846e28561bc7f718c2c:Ballbot_ArduinoIDE/Ballbot_Cpp/Ballbot/controller.h
#define X_OFFSET_RAD 0.05
#define Y_OFFSET_RAD -0.01

//#define DEBUG_SEN
#define PRINT_Values
>>>>>>> 308ed102275a4d833007e360641dd4ba1d51ad69
//#define DEBUG_ANGLE
//#define DEBUG_VELOCITY
//#define DEBUG_PSI
//#define DEBUG_PSI_DOT

struct sensor_values{

  //x-Axis
  float phi_x_spoint ;
  float theta_x_spoint ;
  float psi_x_spoint ;

  float phi_x_cpoint ;
  float theta_x_cpoint;
  float psi_x_cpoint ;

  float phi_x_dot_spoint;
  float theta_x_dot_spoint;
  float psi_x_dot_spoint; 

  float phi_x_dot_cpoint;
  float theta_x_dot_cpoint; 
  float psi_x_dot_cpoint; 

  //xz planar
  float phi_y_spoint;
  float theta_y_spoint;
  float psi_y_spoint;

  float phi_y_cpoint;
  float theta_y_cpoint;
  float psi_y_cpoint;

  float phi_y_dot_spoint;
  float theta_y_dot_spoint;
  float psi_y_dot_spoint; 

  float phi_y_dot_cpoint;
  float theta_y_dot_cpoint; 
  float psi_y_dot_cpoint; 

  //xy planar
  float phi_z_spoint;
  float theta_z_spoint;
  float psi_z_spoint;

  float phi_z_cpoint;
  float theta_z_cpoint;
  float psi_z_cpoint;

  float phi_z_dot_spoint;
  float theta_z_dot_spoint;
  float psi_z_dot_spoint; 

  float phi_z_dot_cpoint;
  float theta_z_dot_cpoint; 
  float psi_z_dot_cpoint; 

};


struct controller_values
{
  // K_values for x-direction
  float K_yz_phi; 
  float K_yz_theta; 
  float K_yz_phi_dot; 
  float K_yz_theta_dot;

  // K_values for y-direction
  float K_xz_phi;
  float K_xz_theta;
  float K_xz_phi_dot;
  float K_xz_theta_dot;

  // controller values for z-direction
  float K_xy;
  float T_1;
  float T_r;

  // .....
  float diff;
  float e;
  float e_alt;

  //Actuator Size
  float u;
};


class Controller
{
  public:
  float gRes; 
  sensor_values sen_val;
  controller_values ctrl_val;

  float offset_x;
  float offset_y;

  bool init_once_;
  
  Controller();
  ~Controller();
  bool init(void);
  void readIMU(cIMU sensor, BallbotMotorDriver driver);
  float *computePsiDot(float omega_arr[]);
  float *computePsi(float psi_dot_arr[]);
<<<<<<< HEAD
=======
  float *computePsi_new(float psi_real_arr[]);
  float *computePsi_new2(float psi_real_arr[]); 
>>>>>>> 308ed102275a4d833007e360641dd4ba1d51ad69
  float *computePhiDot(float psi_dot_arr[]);
  float *computePhi(float psi_arr[], float theta_arr[]);
  float convert2radiand(float val_deg);
  float *executeController();
<<<<<<< HEAD
  float *computeTorque(float curr_torque_arr[]);
  int *compute2currentunits(float real_torques_arr[]);
=======
  float *executeController2();
  float *computeTorque(float curr_torque_arr[]);
  int16_t *compute2currentunits(float real_torques_arr[]);

  bool imu_init(cIMU sensor);
>>>>>>> 308ed102275a4d833007e360641dd4ba1d51ad69
  
};

#endif
