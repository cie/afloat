component Main {
  style app {
    display: grid;
    /* place-content: center; */
    /* place-items: center; */
    background-color: #282C34;
    height: 100vh;
    width: 100vw;

    font-family: Open Sans;
    font-weight: bold;
  }

  style bottom-center {
    position: fixed;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
  }

  style btn {
    background: none;
    border: none;
    appearance: none;
    padding: 4px;

    >svg {
      fill: white;
    }
  }

  connect Clock exposing { dir, pause, forward, backward }

  fun render : Html {
    <div::app>
      <Viewport/>

      <div::bottom-center>
        if (dir == Clock.Dir::Forward || dir == Clock.Dir::Backward ) {
          <button::btn id="pause" onClick={pause}>
            <svg
              width="20"
              height="20">

              <path d="M0 0 L0 20 L7 20 L7 0 Z M13 0 L13 20 L20 20 L20 0 Z"/>

            </svg>
          </button>
        } else {
          <span>
            <button::btn onClick={backward}>
              <svg
                width="12"
                height="20">
                <path d="M12 0 L0 10 L12 20 Z"/>
              </svg>
            </button>

            <button::btn onClick={forward}>
              <svg
                width="12"
                height="20">
                <path d="M0 0 L12 10 L0 20 Z"/>
              </svg>
            </button>
          </span>
        }
      </div>
    </div>
  }
}
