
TARGET=identificadors

all : $(TARGET)

$(TARGET) : $(TARGET).lex
	lex $(TARGET).lex
	$(CC) -Wall lex.yy.c -o $(TARGET) -ll

clean:
	$(RM) *~ lex.yy.c $(TARGET)

