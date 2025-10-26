CC=gcc
CFLAGS=-std=c11 -Wall -Wextra -Werror -O2

# Ajuste a lista conforme for adicionando exercícios
TARGETS= \
  pset1/mario \
  pset1/cash \
  pset1/credit \
  pset2/caesar \
  pset2/substitution \
  pset2/readability \
  pset2/scrabble \
  pset3/plurality \
  pset3/runoff

all: $(TARGETS)

%: %.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(TARGETS)
