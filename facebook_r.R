
library(Rfacebook)

token <- "CAACEdEose0cBACRTDzcWuZCUsmYn42nEDK5fUGT0A6AiuKAMDHXc9MuRY3ZABiViDUJ8mGKLaQABi6mZCVozCpEm7IruQOrmZCSiaZCuRZCsClZAGMcn8qqU8aYZCPq3KZCTEvepgXg2FKCyNdsw1byIgX2ibC5M7bioBX2JF5AIlP553JR6KLypRwwDYcgoldZAYNBGrqhD3yFwZDZD"

me <- getUsers("abtran", token, private_info = TRUE)
me$name # my name

my_friends <- getFriends(token, simplify = TRUE)
my_friends_info <- getUsers(my_friends$id, token, private_info = TRUE)

