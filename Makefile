TARGET = pg-start
SRCS = main.c
OBJS = main.o
HDRS =

CC_FLAGS = -g -ggdb

# Slackware
CC_FLAGS += -I/usr/include

# Ubuntu
CC_FLAGS += -I/usr/include/postgresql

# OpenBSD
CC_FLAGS += -I/usr/local/include/postgresql

# Slackware/Ubuntu
LD_FLAGS = -lpq

# OpenBSD
LD_FLAGS +=-L/usr/local/lib -lpq

$(TARGET) : $(OBJS)
	$(CC) -o $(TARGET) $(OBJS) $(LD_FLAGS)
	
$(OBJS) : $(SRCS) $(HDRS)
	$(CC) -c $(SRCS) $(CC_FLAGS)
	
.PHONY:
clean :
	rm $(TARGET) $(OBJS)
