library(devtools)

load_all("skel")
dyn.load("skel/src/soobench.so")

fn = generate_rosenbrock_function(1)

fn(3)

