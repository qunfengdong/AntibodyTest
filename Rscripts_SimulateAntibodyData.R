
##################################################
#Simulate antibody test results
#number of people being tested for antibody
N <- 1000
#true infection rate
prob_infection <- 0.2 #20% of infection
#test accuracy
true_positive <- 0.96 #if truly infected, 90% chance being bested positive
false_positive <- 1-0.993 #if not infected, 10% chance being tested postitive
#simulate N subject with the expected infection rate
infection_status <- c(rep(1,N*prob_infection),rep(0,N*(1-prob_infection)))
infection_status <- sample(infection_status, replace=FALSE)
set.seed(100)
#simulate test positive
(test_result <- rep(NA, N))
for(i in 1:N){
  infected_test_result <- rbinom(1, 1, true_positive)
  noninfected_test_result <- rbinom(1, 1, false_positive)
  test_result[i] <- ifelse(infection_status[i], infected_test_result, noninfected_test_result)  
}
test_result #this is the vector containing all the simulated test results
length(which(test_result==1)) #number of test postive subjects

