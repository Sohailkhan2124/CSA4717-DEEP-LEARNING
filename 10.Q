import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

def estimate_coef(x, y):
    # number of observations/points
    n = np.size(x)
    
    # mean of x and y vector
    mean_x, mean_y = np.mean(x), np.mean(y)
    
    # calculating cross-deviation and deviation about x
    SS_xy = np.sum(y*x) - n*mean_y*mean_x
    SS_xx = np.sum(x*x) - n*mean_x*mean_x
    
    # calculating regression coefficients
    b_1 = SS_xy / SS_xx
    b_0 = mean_y - b_1*mean_x
    
    return(b_0, b_1)

def plot_regression_line(x, y, b):
    # plotting the actual points as scatter plot
    plt.scatter(x, y, color = "m", marker = "o", s = 30)
    
    # predicted response vector
    y_pred = b[0] + b[1]*x
    
    # plotting the regression line
    plt.plot(x, y_pred, color = "g")
    
    # putting labels
    plt.xlabel('x')
    plt.ylabel('y')
    
    # function to show plot
    plt.show()

def main():
    # generating random data points
    x = np.random.rand(100)
    y = 2*x + np.random.normal(0, 0.1, 100)  # y = 2x + noise
    
    # estimating coefficients
    b = estimate_coef(x, y)
    print("Estimated coefficients:\nb_0 = {}  \nb_1 = {}".format(b[0], b[1]))
    
    # plotting regression line
    plot_regression_line(x, y, b)

if __name__ == "__main__":
    main()
