// Generated by CoffeeScript 1.11.1
(function() {
  var root;

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  root.SearchResults = {
    request: {
      address: '2114 Bigelow Ave',
      citystatezip: 'Seattle, WA'
    },
    message: {
      text: 'Request successfully processed',
      code: 0
    },
    response: {
      results: [
        {
          result: {
            zpid: '48749425',
            links: {
              homedetails: 'http://www.zillow.com/homedetails/2114-Bigelow-Ave-N-Seattle-WA-98109/48749425_zpid/',
              graphsanddata: 'http://www.zillow.com/homedetails/2114-Bigelow-Ave-N-Seattle-WA-98109/48749425_zpid/#charts-and-data',
              mapthishome: 'http://www.zillow.com/homes/48749425_zpid/',
              comparables: 'http://www.zillow.com/homes/comps/48749425_zpid/'
            },
            address: {
              street: '2114 Bigelow Ave N',
              zipcode: '98109',
              city: 'Seattle',
              state: 'WA',
              latitude: '47.637933',
              longitude: '-122.347938'
            },
            zestimate: {
              amount: {
                currency: 'USD',
                value: '1576693'
              },
              lastUpdated: '10/27/2016',
              valueChange: {
                duration: '30',
                currency: 'USD',
                value: '-24434'
              },
              valuationRange: {
                low: {
                  currency: 'USD',
                  value: '1497858'
                },
                high: {
                  currency: 'USD',
                  value: '1655528'
                }
              },
              percentile: '0'
            },
            localRealEstate: {
              region: {
                name: 'East Queen Anne',
                id: '271856',
                type: 'neighborhood',
                zindexValue: '821,600',
                links: {
                  overview: 'http://www.zillow.com/local-info/WA-Seattle/East-Queen-Anne/r_271856/',
                  forSaleByOwner: 'http://www.zillow.com/east-queen-anne-seattle-wa/fsbo/',
                  forSale: 'http://www.zillow.com/east-queen-anne-seattle-wa/'
                }
              }
            }
          }
        }
      ]
    }
  };

}).call(this);

//# sourceMappingURL=sample-response.js.map
