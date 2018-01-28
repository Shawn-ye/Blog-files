#include	<sys/types.h>
#include	<sys/socket.h>
#include	<netinet/in.h>
#include	<arpa/inet.h>
#include 	<unistd.h>
#include	<stdio.h>
#include	<time.h>
#include 	<string.h>

int	main(int argc, char **argv)
{
	int					listenfd, connfd;
	struct sockaddr_in	servaddr, cliaddr;
	socklen_t			len;
	char				buff[4096];
	time_t				ticks;

	listenfd = socket(AF_INET, SOCK_STREAM, 0);

	bzero(&servaddr, sizeof(servaddr));
	servaddr.sin_family      = AF_INET;
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servaddr.sin_port        = htons(8000);	/* daytime server */

	int bindState = bind(listenfd, (struct sockaddr *) &servaddr, sizeof(servaddr));
	if (bindState != 0)	{
		printf("Bind error\n");
		return 0;
	}

	listen(listenfd, 1024);

	int pid;
	pid = fork();
	if (pid < 0)	{
		printf("fork error");
		return -1;
	} else if (pid == 0)	{
		//	Parent process.
		while (1)	{
			len = sizeof(cliaddr);
			connfd = accept(listenfd, (struct sockaddr *) &cliaddr, &len);
			printf("Master: connection from %s, port %d\n",
				inet_ntop(AF_INET, &cliaddr.sin_addr, buff, sizeof(buff)),
				ntohs(cliaddr.sin_port));
			close(connfd);
		}
	} else {
		//	Child process
		while (1)	{
			len = sizeof(cliaddr);
			connfd = accept(listenfd, (struct sockaddr *) &cliaddr, &len);
			printf("Child: connection from %s, port %d\n",
				inet_ntop(AF_INET, &cliaddr.sin_addr, buff, sizeof(buff)),
				ntohs(cliaddr.sin_port));
			close(connfd);
		}
	}

}
