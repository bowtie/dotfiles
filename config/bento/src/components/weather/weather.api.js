class WeatherForecastClient {
  constructor(lat,lon) {
    this.appId = 'a0be14517b93f71540553d16232f1822';
    this.url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&units=metric&appid=${this.appId}`;
  }

  async getWeather() {
    return await fetch(this.url)
      .then(res  => res.json())
      .then(json => JSON.stringify(json))
      .then(json => JSON.parse(json))
      .then(data => {
        const temperature = Math.round(data.main.temp);
        const condition = data.weather[0].main.toLowerCase();

        return {
          temperature,
          condition
        };
      })
      .catch(err => console.warn('Weather API returned an error:', err));
  }
}
