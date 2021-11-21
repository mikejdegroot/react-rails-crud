import React, { useEffect, useState } from 'react'

const Beers = () => {
  const [beers, setBeers] = useState([])

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

          // this.setState((prevState) => ({
          //   beers: [...prevState.beers, newEl],
          // }));

          setBeers((state) => [...state, newEl])
        });
      })
      .catch((err) => message.error("Error: " + err));
  };

  useEffect(() => {
    fetchBeers()
  }, [])

  console.log(beers);

  return <div>Beeers</div>
}

export default Beers
