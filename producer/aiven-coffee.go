package main

import (
	"flag"
	"fmt"
	"log"
	"math/rand"
	"sync"
	"time"

	"github.com/joho/godotenv"
	"github.com/troysellers/e2e-producer/data"
)

func init() {
	if err := godotenv.Load(); err != nil {
		log.Fatal(err)
	}
}

func main() {
	fmt.Println("We shoud be running.")
	prepop := flag.Bool("prepop", false, "Prepopulate the database with data")
	flag.Parse()

	stores, err := data.GetStores()
	if err != nil {
		log.Fatal(err)
	}
	customers, err := data.GetCustomers()
	if err != nil {
		log.Fatal()
	}

	items, err := data.GetItems()
	if err != nil {
		log.Fatal(err)
	}

	var wg sync.WaitGroup
	for i := 1; i <= 100; i++ {
		wg.Add(1)
		go startOrdering(prepop, customers, stores, items, &wg)
	}
	wg.Wait()
}

func startOrdering(prepop *bool, customers []*data.Customer, stores []*data.Store, items []*data.Item, wg *sync.WaitGroup) {
	r := time.Duration(rand.Intn(60))
	time.Sleep(r * time.Second)
	for { // it never ends!
		i := items[rand.Intn(len(items)-1)]
		// create order
		o := &data.Purchase{}
		o.ItemId = i.Id
		o.TotalQuantity = (int64)(rand.Intn(5) + 1)
		o.Price = (int64)(i.Price * o.TotalQuantity)
		o.StoreId = stores[rand.Intn(len(stores)-1)].Id
		o.CustomerId = customers[rand.Intn(len(customers)-1)].Id
		o.OrderPlaced = randomBusinessTime(prepop)
		if rand.Intn(100) <= 99 { //every now and then, an order will be missed.
			o.OrderCollected = o.OrderPlaced.Add(1500 * time.Second)
		}
		if err := o.CreateOrder(); err != nil {
			log.Println(err)
		}
		log.Printf("ordered at %v", o.OrderPlaced)
		time.Sleep(1 * time.Second)
	}
}

func randomBusinessTime(prepop *bool) time.Time {
	now := time.Now()
	var year, day int
	var month time.Month

	if *prepop {

		rand.Seed(time.Now().UnixNano())
		randomDays := rand.Intn(731)
		subDate := now.AddDate(0, 0, -randomDays)
		// Generate a random time in the last 2 years
		year = subDate.Year()
		month = subDate.Month()
		day = subDate.Day()
	} else {
		year = now.Year()
		month = now.Month()
		day = now.Day()
	}
	// Generate a random time between 9am and 5pm
	hour := rand.Intn(8) + 9
	minute := rand.Intn(60)
	second := rand.Intn(60)

	return time.Date(year, month, day, hour, minute, second, 0, time.UTC)
}
