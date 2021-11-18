SHELL = /bin/sh
CC = gcc
FLAGS = -std=c99
N_TEMP = temp.a
CFLAGS = -Werror -Wall -Wextra -c -g
LIBFT = ./libft/libft.a

NAME = libftprintf.a

SOURCES = malloc.c \
		  free.c \
		  write.c \
		  va_start.c \
		  va_arg.c \
		  va_copy.c \
		  va_end.c \
HEADERS = libftprintf.h \
OBJECTS = $(SOURCES:.c=.o)
BONUS_OBJECTS = $(BONUS:.c=.o)

PREFIX = $(DESTDIR)/usr/local
BINDIR = $(PREFIX)/bin

all: $(NAME)


$(NAME): $(OBJECTS)
	ar	rcs $(NAME)	$(OBJECTS)

$(OBJECT): $(SRC)
	$(CC)	$(FLAGS)	$(CFLAGS)	-o	$(NAME) $(OBJECTS) $(HEADERS)

clean:
	$(MAKE) bonus -C ./libft
	cp libft/libft.a $(NAME)
	$(CC) $(FLAGS) $(INCLUDES) $(SOURCES)
	ar -rcs $(NAME) $(OBJECTS)

fclean: clean
	$(MAKE) fclean -C ./libft
	rm -rf $(NAME)
	@echo "[INFO] Library [$(NAME)] removed!"

#For when you fucked up
re: fclean	all

.PHONY
	all clan fclean re

