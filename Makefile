CC=g++
CFLAGS=-g -Wall 
OBJ=proxy_parse.o proxy_server.o
TARGET=proxy

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ) -lpthread

proxy_parse.o: proxy_parse.c proxy_parse.h
	$(CC) $(CFLAGS) -c proxy_parse.c

proxy_server.o: proxy_server.c proxy_parse.h
	$(CC) $(CFLAGS) -c proxy_server.c

clean:
	rm -f $(TARGET) *.o

tar:
	tar -cvzf ass1.tgz proxy_server.c README Makefile proxy_parse.c proxy_parse.h
