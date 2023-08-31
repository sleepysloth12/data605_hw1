#My initials are JJ

# Vertical line of J
x1 = rep(0, 1000)
y1 = seq(-1, 1, length.out=1000)

# horizontal bottom of J
x2 = seq(-0.25,0, length.out=125)
y2 = rep(-1,125)

# horizontal top of J
x3 = seq(-0.25,0.25, length.out=250)
y3 = rep(1,250)

#small vertical part of J
x4 = rep(-0.25, 250)
y4 = seq(-1,-0.5, length.out=250)


# Combine the coordinates for the first J
first_x = c(x1,x2,x3,x4)
first_y = c(y1,y2,y3,y4)


#Shifting the second J by 2 to the right so i add 2 to x

second_x=first_x+2
second_y=first_y

#Both Js combined
x=c(first_x,second_x)
y=c(first_y,second_y)



# plot
plot(y~x, xlim=c(-3,3), ylim=c(-3,3))


# matrix from the x and y coordinates
coord_matrix = matrix(c(x, y), ncol=2)
coord_matrix
plot(coord_matrix, xlim=c(-3,3), ylim=c(-3,3))

# Identity matrix
identity_matrix = matrix(c(1, 0, 0, 1), ncol=2)
identity_matrix


#shear randomly
shear_matrix=identity_matrix
shear_matrix[1,2]=3
shear_matrix[2,1]=2
transformed_matrix_shear= coord_matrix %*% shear_matrix
a=plot(transformed_matrix_shear, xlim=c(-3,3), ylim=c(-3,3))

#scaling making JJ smaller by half
scale_matrix=identity_matrix
scale_matrix[1,1]=0.5
scale_matrix[2,2]=0.5
transformed_matrix_scale=coord_matrix %*% scale_matrix
b=plot(transformed_matrix_scale, xlim=c(-3,3), ylim=c(-3,3))

#rotation clockwise .8 rad

rot_matrix=matrix(c(cos(0.8),-sin(0.8),sin(0.8),cos(0.8)),ncol=2)
transformed_matrix_rot=coord_matrix %*% rot_matrix
c=plot(transformed_matrix_rot, xlim=c(-3,3), ylim=c(-3,3))


#projecting onto x axis

proj_matrix=matrix(c(1,0,0,0),ncol=2)
transformed_matrix_proj=coord_matrix %*% proj_matrix
d=plot(transformed_matrix_proj, xlim=c(-3,3), ylim=c(-3,3))


matrices = list(coord_matrix, transformed_matrix_shear, coord_matrix, transformed_matrix_scale, coord_matrix, transformed_matrix_rot, coord_matrix, transformed_matrix_proj)
titles = c("Original JJ", "Shear Transformation", "Original JJ", "Scaling Transformation", "Original JJ", "Rotation Transformation", "Original JJ", "Projection Transformation")

# Open a new plotting window
x11() 

for (i in 1:length(matrices)) {
  
  # Clear the plot window
  plot.new()
  plot(matrices[[i]][,2] ~ matrices[[i]][,1], xlim=c(-3,5), ylim=c(-3,3))
  
  #cycle thru titles
  title(main=titles[i])
  
  #wait b4 continuing
  Sys.sleep(3)
}
