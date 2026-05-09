########################################################################
######################## Makefile 3EnRaya ##############################
########################################################################

# Compiler settings - Can be customized.
CC = gcc
CFLAGS = -std=c11 -Wall -Wextra -Wrestrict -pedantic -O2
LDFLAGS =

# Makefile settings - Can be customized.
EXT = .c
SRCDIR = src
OBJDIR = obj
BINDIR = bin
SERVER_APP = $(BINDIR)/3enraya_server
CLIENT_APP = $(BINDIR)/3enraya_client

########################################################################
####################### Internal build variables #######################
########################################################################

SERVER_SRC = $(SRCDIR)/server$(EXT)
CLIENT_SRC = $(SRCDIR)/client$(EXT)
SERVER_OBJ = $(OBJDIR)/server.o
CLIENT_OBJ = $(OBJDIR)/client.o
OBJ = $(SERVER_OBJ) $(CLIENT_OBJ)
DEP = $(OBJ:.o=.d)
RM = rm -rf

########################################################################
############################# Targets ##################################
########################################################################

.PHONY: all clean cleandep test run-server run-client

all: $(SERVER_APP) $(CLIENT_APP)

$(BINDIR) $(OBJDIR):
	mkdir -p $@

$(SERVER_APP): $(SERVER_OBJ) | $(BINDIR)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(CLIENT_APP): $(CLIENT_OBJ) | $(BINDIR)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%$(EXT) | $(OBJDIR)
	$(CC) $(CFLAGS) -MMD -MP -o $@ -c $<

-include $(DEP)

test: all
	bash tests/smoke_test.sh

run-server: all
	./$(SERVER_APP) --host 127.0.0.1 --port 5000

run-client: all
	./$(CLIENT_APP) --host 127.0.0.1 --port 5000 --name Jugador

clean:
	$(RM) $(OBJDIR) $(BINDIR) server-test.log

cleandep:
	$(RM) $(DEP)
