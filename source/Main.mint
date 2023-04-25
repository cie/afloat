component Main {
  style app {
    display: grid;
    place-content: stretch;
    place-items: stretch;
    background-color: #282C34;
    height: 100vh;
    width: 100vw;

    font-family: Open Sans;
    font-weight: bold;
  }

  fun render : Html {
    <div::app>
      <Viewport/>
    </div>
  }
}
