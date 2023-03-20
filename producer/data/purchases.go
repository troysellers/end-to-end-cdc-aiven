package data

import (
	"context"
	"os"
	"time"

	"github.com/jackc/pgx/v5"
)

type Purchase struct {
	Id             int64
	StoreId        int64
	ItemId         int64
	CustomerId     int64
	TotalQuantity  int64
	Price          int64
	OrderPlaced    time.Time
	OrderCollected time.Time
}

func (o *Purchase) CreateOrder() error {

	config, err := pgx.ParseConfig(os.Getenv("DB_URI"))
	if err != nil {
		return err
	}
	config.DefaultQueryExecMode = pgx.QueryExecModeExec

	conn, err := pgx.ConnectConfig(context.Background(), config)
	if err != nil {
		return err
	}

	defer conn.Close(context.Background())

	_, err = conn.Exec(context.Background(), "insert into purchase (item_id, store_id, customer_id, total_quantity, price, order_placed, order_collected) values ($1,$2,$3,$4,$5,$6, $7)", o.ItemId, o.StoreId, o.CustomerId, o.TotalQuantity, o.Price, o.OrderPlaced, o.OrderCollected)
	if err != nil {
		return err
	}
	return nil
}
