#include "SimpleSocket.hpp"

// Default constructor

SHS::SimpleSocket::SimpleSocket(
  int domain,
  int service,
  int protocol,
  int port,
  u_long interface
) {
  // Define addresss structure
  address.sin_family = domain;
  address.sin_port = htons(port);
  address.sin_addr.s_addr = htonl(interface);

  // Estabilish connection
  sock = socket(domain, service, protocol);

  test_connection(sock);

  // Establish network connection
  connection = connect_to_network(sock, address);
  
  test_connection(connection);
}

// Test connection virtual function

void SHS::SimpleSocket::test_connection(int item_to_test) {
  // Confirm that the socket or connection has been properly established
  if (item_to_test < 0) {
    perror("Failed to connect...");
    exit(EXIT_FAILURE);
  }
}

// Getter functions

struct sockaddr_in SHS::SimpleSocket::get_address() {
  return address;
}

int SHS::SimpleSocket::get_sock() {
  return sock;
}

int SHS::SimpleSocket::get_connection() {
  return connection;
}