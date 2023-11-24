library("stringr")

alumni <- read.csv("alumni.csv")
salaries <- read.csv("salaries-by-college-type.csv")

schools <- alumni$school
School.Names <- salaries$School.Name

#add a column called school ID to the salaries dataset
#merge using school_id and school columns 

for (school.name in School.Names){ 
  for (school in schools){
    if (str_detect(school, school.name)==TRUE){
      salaries$School_ID <- school 
    }
  }
}

df <- merge(x=alumni, y=salaries, by.x= c("school"), by.y = c("School_ID"), all.x=TRUE)
