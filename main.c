#include <stdio.h>
#include <stdlib.h>

#include <libpq-fe.h>

int main(int argc, char *argv[])
{
	PGconn *conn;
	PGresult *res;
	
	int i;
	
	char query_string[] = "SELECT * FROM dbname;";
	
	conn = PQconnectdb("host='hostname' dbname='dbname' user='username' password='password'");
	
	if (PQstatus(conn) == CONNECTION_BAD) {
		fprintf(stderr, "Connection failed: %s\n", PQerrorMessage(conn));
		return 1;
	}
	
	res = PQexec(conn, query_string);
	
	if (PQresultStatus(res) != PGRES_TUPLES_OK) {
		fprintf(stderr, "SELECT query failed\n");
		PQclear(res);
		PQfinish(conn);
		return 1;
	}
	
	for (i = 0; i < PQntuples(res); i++) {
		fprintf(stdout, "%s\n", PQgetvalue(res, i, 2));
	}
	
	PQclear(res);
	PQfinish(conn);
	
	return 0;
}
