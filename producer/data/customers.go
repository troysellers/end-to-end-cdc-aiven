package data

import (
	"context"
	"os"

	"github.com/jackc/pgx/v5"
)

type Customer struct {
	Id        int64
	FirstName string
	LastName  string
	Email     string
}

func GetCustomers() ([]*Customer, error) {
	config, err := pgx.ParseConfig(os.Getenv("DB_URI"))
	if err != nil {
		return nil, err
	}
	config.DefaultQueryExecMode = pgx.QueryExecModeExec
	conn, err := pgx.ConnectConfig(context.Background(), config)
	if err != nil {
		return nil, err
	}

	defer conn.Close(context.Background())

	rows, err := conn.Query(context.Background(), "select id from customer")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var customers []*Customer

	for rows.Next() {
		c := &Customer{}
		err := rows.Scan(&c.Id)
		if err != nil {
			return nil, err
		}
		customers = append(customers, c)
	}
	return customers, nil
}
