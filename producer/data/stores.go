package data

import (
	"context"
	"os"

	"github.com/jackc/pgx/v5"
)

type Store struct {
	Id       int64
	Street   string
	City     string
	State    string
	Country  string
	PostCode string
}

func GetStores() ([]*Store, error) {

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

	rows, err := conn.Query(context.Background(), "select id from public.store")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var stores []*Store
	for rows.Next() {
		s := &Store{}
		err := rows.Scan(&s.Id)
		if err != nil {
			return nil, err
		}
		stores = append(stores, s)
	}
	return stores, nil
}
