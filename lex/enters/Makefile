
TARGET=enters

all : $(TARGET)

$(TARGET) : $(TARGET).lex
	lex $(TARGET).lex
	$(CC) -Wall lex.yy.c -o $(TARGET) -ll

clean:
	rm -f *~ lex.yy.c $(TARGET) 

