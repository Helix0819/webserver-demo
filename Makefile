CXX ?= g++

DEBUG ?= 1
ifeq ($(DEBUG), 1)
    CXXFLAGS += -g
else
    CXXFLAGS += -O2

endif

server: src/main.cpp  src/timer/lst_timer.cpp src/http/httpconn.cpp src/log/log.cpp src/pool/sql_connection_pool.cpp  src/server/webserver.cpp src/config/config.cpp
	$(CXX) -o server  $^ $(CXXFLAGS) -lpthread -lmysqlclient

clean:
	rm  -r server