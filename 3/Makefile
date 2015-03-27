
TARGET = ex3
all : $(TARGET)

$(TARGET) : $(TARGET).lex
	lex $(TARGET).lex
	gcc -Wall lex.yy.c -o $(TARGET) 

clean:
	rm -f *~ lex.yy.c $(TARGET)

test:
	./$(TARGET) < $(TARGET).demo    

