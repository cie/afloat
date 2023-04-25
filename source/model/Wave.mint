record Wave {
  x : Number,
  y : Number,
  t : Number
}

component WaveView {
  property t : Number
  property wave : Wave

  fun render : Html {
    <g>
      <circle
        cx={Number.toString(wave.x)}
        cy={Number.toString(wave.y)}
        r={Number.toString(t - wave.t + 1)}
        fill="none"
        stroke="rgba(255,255,255,0.7)"
        stroke-width="1"/>

      <circle
        cx={Number.toString(wave.x)}
        cy={Number.toString(wave.y)}
        r={Number.toString(Math.abs(t - wave.t))}
        fill="none"
        stroke="rgba(255,255,255,0.5)"
        stroke-width="1"/>

      <circle
        cx={Number.toString(wave.x)}
        cy={Number.toString(wave.y)}
        r={Number.toString(Math.abs(t - wave.t - 1))}
        fill="none"
        stroke="rgba(255,255,255,0.3)"
        stroke-width="1"/>
    </g>
  }
}
