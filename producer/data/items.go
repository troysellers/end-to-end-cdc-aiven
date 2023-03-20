package data

import (
	"context"
	"os"

	"github.com/jackc/pgx/v5"
)

type Item struct {
	Id          int64
	Name        string
	Description string
	Price       int64
	Cost        int64
}

func GetItems() ([]*Item, error) {
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

	rows, err := conn.Query(context.Background(), "select * from Item")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var items []*Item

	for rows.Next() {
		i := &Item{}
		err := rows.Scan(&i.Id, &i.Name, &i.Description, &i.Price, &i.Cost)
		if err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	return items, nil
}
