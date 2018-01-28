#include	<sys/types.h>
#include	<sys/socket.h>
#include	<netinet/in.h>
#include	<arpa/inet.h>
#include 	<unistd.h>
#include	<stdio.h>
#include	<time.h>
#include 	<string.h>
#include    <stdlib.h>

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
	pid_t pid;
    len = sizeof(cliaddr);
    while (1)   {
        connfd = accept(listenfd, (struct sockaddr *) &cliaddr, &len);
        if ((pid = fork()) == 0)    {
            //  Child process
            // printf("PID %d", getpid());
            printf("PID %d: connection from %s, port %d\n", getpid(),
                inet_ntop(AF_INET, &cliaddr.sin_addr, buff, sizeof(buff)),
                ntohs(cliaddr.sin_port));
            close(connfd);
            exit(0);
        }
        close(connfd);
    }


}
