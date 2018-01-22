from io import StringIO   # StringIO behaves like a file object
import numpy as np
import matplotlib.pyplot as plt

def read_values():
    c=open("filter_compare_test_units3","r")
    return (np.loadtxt(c))

def print_theta(input_values):
    # Angles:
    f, axarr = plt.subplots(2, sharex=True)
    axarr[0].plot(input_values[:,0],input_values[:,1],label="theta_x")
    axarr[0].plot(input_values[:,0],input_values[:,3],label="theta_y")
    #axarr[0].set_title('Theta x and theta y sec over °')
    axarr.flat[0].set(xlabel="t in sec", ylabel="°")
    axarr[0].legend()
    print("mean x - angle: ",np.mean(input_values[:,1]))
    print("mean y - angle: ",np.mean(input_values[:,3]))
    print("std(sigma) x° : ",np.std(input_values[:,1]))
    print("std(sigma) y° : ",np.std(input_values[:,3]))

    # Angular Velocities
    axarr[1].plot(input_values[:,0],input_values[:,2],label="dtheta_x")
    axarr[1].plot(input_values[:,0],input_values[:,4],label="dtheta_y")
    #axarr[1].set_title('Dtheta x and dtheta y sec over °/sec')
    axarr.flat[1].set(ylabel="°/s")
    axarr[1].legend()
    f.subplots_adjust(hspace=0.3)

    f2, axarr2 = plt.subplots(3, sharex=True)
    # Motor Torques on wheel 1-3:
    for i in range(0,3):
        axarr2[i].plot(input_values[:,0],input_values[:,5+2*i],label="measured_m"+str(i+1))
        axarr2[i].plot(input_values[:,0],input_values[:,6+2*i],label="desired_m"+str(i+1))
        axarr2[i].set_title('')
        axarr2.flat[i].set(ylabel="Units")
        axarr2[i].legend()
    f2.subplots_adjust(hspace=0.3)

    plt.show()

def print_wheel(input_line):
    vec = np.linspace(0,len(input_line),len(input_line))
    plt.scatter(vec, input_line)
    plt.show()
    print(vec)

def print_IMU_FILTER_TEST(input_values):
    plt.plot(input_values[:,0],input_values[:,1],label="ungefiltert")
    plt.plot(input_values[:,0],input_values[:,2],label="gefiltert")
    plt.legend()
    plt.show()

def compare_torque_with_and_without_filter(input_values):
    f, axarr = plt.subplots(3, sharex=True)
    axarr[0].plot(input_values[:,0],input_values[:,6],label="t1_mit_filter")
    axarr[0].plot(input_values[:,0],input_values[:,11],label="t1_ohne_filter")
    #axarr[0].set_title('Theta x and theta y sec over °')
    axarr.flat[0].set(xlabel="t in sec", ylabel="Nm")
    axarr[0].legend()

    axarr[1].plot(input_values[:,0],input_values[:,8],label="t2_mit_filter")
    axarr[1].plot(input_values[:,0],input_values[:,12],label="t2_ohne_filter")
    #axarr[0].set_title('Theta x and theta y sec over °')
    axarr.flat[1].set(xlabel="t in sec", ylabel="Nm")
    axarr[1].legend()

    axarr[2].plot(input_values[:,0],input_values[:,10],label="t3_mit_filter")
    axarr[2].plot(input_values[:,0],input_values[:,13],label="t3_ohne_filter")
    #axarr[0].set_title('Theta x and theta y sec over °')
    axarr.flat[2].set(xlabel="t in sec", ylabel="Nm")
    axarr[2].legend()

    plt.show()

def compare_filter(input_values):
    f, axarr = plt.subplots(2, sharex=True)
    axarr[0].plot(input_values[:,0],input_values[:,1],label="theta_x_ohne_filter")
    axarr[0].plot(input_values[:,0],input_values[:,5],label="theta_x_mit_filter")
    axarr.flat[0].set(xlabel="t in sec", ylabel="°")
    axarr[0].legend()

    axarr[1].plot(input_values[:,0],input_values[:,3],label="theta_y_ohne_filter")
    axarr[1].plot(input_values[:,0],input_values[:,7],label="theta_y_mit_filter")
    axarr.flat[1].set(xlabel="t in sec", ylabel="°")
    axarr[1].legend()

    f2, axarr2 = plt.subplots(2, sharex=True)
    axarr2[0].plot(input_values[:,0],input_values[:,2],label="theta_dx_ohne_filter")
    axarr2[0].plot(input_values[:,0],input_values[:,6],label="theta_dx_mit_filter")
    axarr2.flat[0].set(xlabel="t in sec", ylabel="°")
    axarr2[0].legend()

    axarr2[1].plot(input_values[:,0],input_values[:,4],label="theta_dy_ohne_filter")
    axarr2[1].plot(input_values[:,0],input_values[:,8],label="theta_dy_mit_filter")
    axarr2.flat[1].set(xlabel="t in sec", ylabel="°")
    axarr2[1].legend()

    f3, axarr3 = plt.subplots(3, sharex=True)
    axarr3[0].plot(input_values[:,0],input_values[:,9],label="t1_ohne_filter")
    axarr3[0].plot(input_values[:,0],input_values[:,12],label="t1_mit_filter")
    #axarr3[0].plot(input_values[:, 0], input_values[:, 15], label="t1_gemessen")
    axarr3.flat[0].set(xlabel="t in sec", ylabel="Nm")
    axarr3[0].legend()

    axarr3[1].plot(input_values[:,0],input_values[:,10],label="t2_ohne_filter")
    axarr3[1].plot(input_values[:,0],input_values[:,13],label="t2_mit_filter")
    #axarr3[1].plot(input_values[:, 0], input_values[:, 16], label="t2_gemessen")
    axarr3.flat[1].set(xlabel="t in sec", ylabel="Nm")
    axarr3[1].legend()

    axarr3[2].plot(input_values[:,0],input_values[:,11],label="t2_ohne_filter")
    axarr3[2].plot(input_values[:,0],input_values[:,14],label="t2_mit_filter")
    #axarr3[2].plot(input_values[:, 0], input_values[:, 17], label="t3_gemessen")
    axarr3.flat[2].set(xlabel="t in sec", ylabel="Nm")
    axarr3[2].legend()

    plt.show()

tmp = read_values()
#print_IMU_FILTER_TEST(tmp)
#print_theta(tmp)
#print_wheel(tmp)
compare_filter(tmp)


#Ergebnisse für leerlauf:
#mean x - angle:  -0.0282978397426
#mean y - angle:  -0.000448904550329
#std(sigma) x° :  0.208474358111
#std(sigma) y° :  0.205623925704