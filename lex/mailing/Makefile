
TARGET = mailing
all : $(TARGET)

$(TARGET) : $(TARGET).lex
	lex $(TARGET).lex
	gcc lex.yy.c -o $(TARGET) -ll

clean:
	rm -f *~ lex.yy.c $(TARGET)

