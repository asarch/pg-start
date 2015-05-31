TARGET = pg-start
SRCS = main.c
OBJS = main.o
HDRS =

CC_FLAGS = -g -ggdb

# Ubuntu
CC_FLAGS += -I/usr/include/postgresql

# Slackware
CC_FLAGS += -I/usr/include/

LD_FLAGS = -lpq

$(TARGET) : $(OBJS)
	$(CC) -o $(TARGET) $(OBJS) $(LD_FLAGS)
	
$(OBJS) : $(SRCS) $(HDRS)
	$(CC) -c $(SRCS) $(CC_FLAGS)
	
.PHONY:
clean :
	rm $(TARGET) $(OBJS)
