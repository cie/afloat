enum Path {
  Move(Number, Number)
  Line(Number, Number)
  Quad(Number, Number, Number, Number)
  Close
}

module Drawing {
  fun circle(x: Number, y: Number, r: Number): Drawing {
    `((ctx) => {
       ctx.beginPath();
       ctx.moveTo(#{x} + #{r}, #{y});
       ctx.ellipse(#{x}, #{y}, #{r}, #{r}, 0, 0, 2 * Math.PI);
      })`
  }
  fun path(path: Array(Path)): Drawing {
    `(ctx) => {
      ctx.beginPath();
      for (let i = 0; i < #{path}.length; i++) {
        let p = #{path}[i];
        #{
          case (`p`) {
            Path::Move(x, y) => `(ctx) => ctx.moveTo(#{x}, #{y})`
            Path::Line(x, y) => `(ctx) => ctx.lineTo(#{x}, #{y})`
            Path::Quad(x1, y1, x2, y2) => `(ctx) => ctx.quadraticCurveTo(#{x1}, #{y1}, #{x2}, #{y2})`
            Path::Close => `(ctx) => ctx.closePath()`
          }
        }(ctx);
      }
    }`
  }

  fun rect(x: Number, y: Number, w: Number, h: Number): Drawing {
    `((ctx) => {
      ctx.beginPath();
      ctx.rect(#{x}, #{y}, #{w}, #{h});
    })`
  }

  fun translate(drawing: Drawing, x: Number, y: Number): Drawing {
    `((ctx) => {
      ctx.save();
      ctx.translate(#{x}, #{y});
      #{drawing}(ctx);
      ctx.restore();
    })`
  }

  fun fill(drawing: Drawing, color: String): Drawing {
    `((ctx) => {
      ctx.save();
      ctx.fillStyle = #{color};
      #{drawing}(ctx);
      ctx.fill();
      ctx.restore();
    })`
  }

  fun stroke(drawing: Drawing, color: String, width: Number): Drawing {
    `((ctx) => {
      ctx.save();
      ctx.strokeStyle = #{color};
      ctx.lineWidth = #{width};
      #{drawing}(ctx);
      ctx.stroke();
      ctx.restore();
    })`
  }

  fun rotate(drawing: Drawing, angle: Number): Drawing {
    `((ctx) => {
      ctx.save();
      ctx.rotate(#{angle});
      #{drawing}(ctx);
      ctx.restore();
    })`
  }

  fun each(drawings: Array(Drawing)): Drawing {
    `(ctx) => {
      for (let i = 0; i < #{drawings}.length; i++) {
        #{drawings}[i](ctx);
      }
    }`
  }

  fun onto(drawing: Drawing, canvas: Maybe(Dom.Element)): Promise(Void) {
    case (canvas) {
      Maybe::Nothing => Promise.never()
      Maybe::Just(canvas) =>
        `(new Promise((resolve, reject) => {
          let ctx = #{canvas}.getContext("2d");
          if (ctx) {
            resolve(ctx);
          } else {
            reject("Could not get 2d context");
          }
        })).then((ctx) => {
          ctx.clearRect(0, 0, #{canvas}.width, #{canvas}.height);
          #{drawing}(ctx);
        })`
    }
  }
}