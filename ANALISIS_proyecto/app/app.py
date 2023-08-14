from flask import Flask, render_template, request

app = Flask(__name__)


@app.route("/")
def index():
    # return "<h1>Proyecto analisis _jaja</h1>"
    animales = ["gato", "perro"]
    data = {
        "titulo": "Index123",
        "bienvenida": "saludos",
        "animales": animales,
        "num_animales": len(animales),
    }
    return render_template("index.html", data=data)


@app.route("/contacto/<nombre>/<int:edad>")
def contacto(nombre, edad):
    data = {"titulo": "Contacto", "nombre": nombre, "edad": edad}
    return render_template("contacto.html", data=data)


if __name__ == "__main__":
    app.run(debug=True, port=5000)
