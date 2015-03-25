
TARGET = contador
all : $(TARGET)

$(TARGET) : $(TARGET).lex
	lex $(TARGET).lex
	gcc -Wall lex.yy.c -o $(TARGET) -ll

clean:
	rm -f *~ lex.yy.c $(TARGET)

