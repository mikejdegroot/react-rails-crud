import React, { useEffect, useState } from 'react'
import { Table, message, Popconfirm } from "antd";

const Beers = () => {
  const [beers, setBeers] = useState([])
  // ant d table setup
  const columns = [
    {
      title: "Brand",
      dataIndex: "brand",
      key: "brand",
    },
    {
      title: "Style",
      dataIndex: "style",
      key: "style",
    },
    {
      title: "Country",
      dataIndex: "country",
      key: "country",
    },
    {
      title: "Quantity",
      dataIndex: "quantity",
      key: "quantity",
    },
    {
      title: "",
      key: "action",
      render: (_text, record) => (
        <Popconfirm title="Are you sure to delete this beer?" onConfirm={() => deleteBeer(record.id)} okText="Yes" cancelText="No">
          <a href="#" type="danger">
            Delete{" "}
          </a>
        </Popconfirm>
      ),
    },
  ];

  const fetchBeers = () => {
    const url = "api/v1/beers/index";
    fetch(url)
      .then((data) => {
        console.log(data);
        if (data.ok) {
          return data.json();
        }
        throw new Error("Network error.");
      })
      .then((data) => {
        data.forEach((beer) => {
          const newEl = {
            key: beer.id,
            id: beer.id,
            brand: beer.brand,
            style: beer.style,
            country: beer.country,
            quantity: beer.quantity,
          };

          setBeers((state) => [...state, newEl])
        });
      })
      .catch((err) => message.error("Error: " + err));
  };

  const deleteBeer = (id) => {
    const url = `api/v1/beers/${id}`;

    fetch(url, {
      method: "delete",
    })
      .then((data) => {
        if (data.ok) {
          this.reloadBeers();
          return data.json();
        }
        throw new Error("Network error.");
      })
      .catch((err) => message.error("Error: " + err));
  };

  useEffect(() => {
    fetchBeers()
  }, [])

  console.log(beers);

  return (
    <>
      <Table className="table-striped-rows" dataSource={beers} columns={columns} pagination={{ pageSize: 5 }} />

      {/* <AddBeerModal reloadBeers={this.reloadBeers} /> */}
    </>
  );
}

export default Beers
