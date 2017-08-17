
source('funcionError.R')
#error <- parametros 3 ,condiciones_iniciales 3

observaciones_S <- rep.int(2, 10001)
observaciones_I <- rep.int(1, 10001)
observaciones_R <- rep.int(4, 10001)

observaciones <- tibble(observaciones_S, observaciones_I, observaciones_R)


# demoCMA1.R
J <- function(x){
  error(x[1:3],x[4:6],observaciones);
  }

J(c(0,0,0,0,0,0))
cma <- cmaNew();
cmaInit(cma,seed=42,dimension=6,initialX=1.5, initialStandardDeviations=0.2);
res1 = cmaOptimDP(cma,J,iterPrint=30);
plot(res1$fitnessVec,type="l",log="y",col="blue",xlab="Iteration",ylab="Fitness");
str(res1)
