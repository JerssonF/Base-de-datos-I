import tkinter as tk
from tkinter import ttk
from tkinter import messagebox
from tkinter import simpledialog
import requests

def agregar_registro():
    usuario = simpledialog.askstring("Agregar Registro", "Ingrese el usuario:")
    documento = simpledialog.askstring("Agregar Registro", "Ingrese el documento:")
    colegio = simpledialog.askstring("Agregar Registro", "Ingrese el colegio:")
    profesor = simpledialog.askstring("Agregar Registro", "Ingrese el profesor:")
    grado = simpledialog.askinteger("Agregar Registro", "Ingrese el grado:")
    materia = simpledialog.askstring("Agregar Registro", "Ingrese la materia:")
    nota = simpledialog.askstring("Agregar Registro", "Ingrese la nota:")

    if usuario and documento and colegio and profesor and grado and materia and nota:
        try:
            response = requests.post("http://127.0.0.1:8000/registro", json={
                "Catalinausuario": usuario,
                "Catalinadocumento": documento,
                "Catalinacolegio": colegio,
                "Catalinaprofesor": profesor,
                "Catalinagrado": grado,
                "Catalinamateria": materia,
                "Catalinanota": nota
            })
            messagebox.showinfo("Éxito", "Registro agregado correctamente.") if response.status_code == 201 else messagebox.showerror("Error", "Error al agregar el registro.")
        except Exception as e:
            messagebox.showerror("Error", f"Error de conexión: {str(e)}")
    else:
        messagebox.showwarning("Advertencia", "Por favor, ingrese todos los campos.")
    root.wait_window()

def listar_registros():
    try:
        response = requests.get("http://127.0.0.1:8000/listar")
        registros = response.json() if response.status_code == 200 else []
        mostrar_en_treeview(registros)
    except Exception as e:
        messagebox.showerror("Error", f"Error de conexión: {str(e)}")

def buscar_registro():
    registro_id = simpledialog.askinteger("Buscar Registro", "Ingrese el ID del registro a buscar:")

    if registro_id:
        try:
            response = requests.get(f"http://127.0.0.1:8000/consultar/{registro_id}")
            registro = response.json() if response.status_code == 200 else None
            mostrar_en_treeview([registro]) if registro else messagebox.showwarning("Advertencia", "No se encontró el registro.")
        except Exception as e:
            messagebox.showerror("Error", f"Error de conexión: {str(e)}")
    else:
        messagebox.showwarning("Advertencia", "Por favor, ingrese un ID válido.")
    root.wait_window()

def eliminar_registro():
    registro_id = simpledialog.askinteger("Eliminar Registro", "Ingrese el ID del registro a eliminar:")

    if registro_id:
        try:
            response = requests.delete(f"http://127.0.0.1:8000/borrarregistro/{registro_id}")
            messagebox.showinfo("Éxito", "Registro eliminado correctamente.") if response.status_code == 200 else messagebox.showwarning("Advertencia", "No se encontró el registro.") if response.status_code == 404 else messagebox.showerror("Error", "Error al eliminar el registro.")
        except Exception as e:
            messagebox.showerror("Error", f"Error de conexión: {str(e)}")
    else:
        messagebox.showwarning("Advertencia", "Por favor, ingrese un ID válido.")

def actualizar_registro():
    registro_id = simpledialog.askinteger("Actualizar Registro", "Ingrese el ID del registro a actualizar:")

    if registro_id:
        usuario = simpledialog.askstring("Actualizar Registro", "Ingrese el nuevo usuario:")
        documento = simpledialog.askstring("Actualizar Registro", "Ingrese el nuevo documento:")
        colegio = simpledialog.askstring("Actualizar Registro", "Ingrese el nuevo colegio:")
        profesor = simpledialog.askstring("Actualizar Registro", "Ingrese el nuevo profesor:")
        grado = simpledialog.askinteger("Actualizar Registro", "Ingrese el nuevo grado:")
        materia = simpledialog.askstring("Actualizar Registro", "Ingrese la nueva materia:")
        nota = simpledialog.askstring("Actualizar Registro", "Ingrese la nueva nota:")

        if usuario or documento or colegio or profesor or grado or materia or nota:
            try:
                data = {}
                if usuario:
                    data["Catalinausuario"] = usuario
                if documento:
                    data["Catalinadocumento"] = documento
                if colegio:
                    data["Catalinacolegio"] = colegio
                if profesor:
                    data["Catalinaprofesor"] = profesor
                if grado:
                    data["Catalinagrado"] = grado
                if materia:
                    data["Catalinamateria"] = materia
                if nota:
                    data["Catalinanota"] = nota

                response = requests.post(f"http://127.0.0.1:8000/actualizarregistro/{registro_id}", json=data)
                messagebox.showinfo("Éxito", "Registro actualizado correctamente.") if response.status_code == 200 else messagebox.showwarning("Advertencia", "No se encontró el registro.") if response.status_code == 404 else messagebox.showerror("Error", "Error al actualizar el registro.")
            except Exception as e:
                messagebox.showerror("Error", f"Error de conexión: {str(e)}")
        else:
            messagebox.showwarning("Advertencia", "Ingrese al menos un campo para actualizar.")
    else:
        messagebox.showwarning("Advertencia", "Por favor, ingrese un ID válido.")
    root.wait_window()

def mostrar_en_treeview(data):
    for item in tree.get_children():
        tree.delete(item)
    for row in data:
        tree.insert("", "end", values=(
            row.get("Catalinaid", ""),
            row.get("Catalinausuario", ""),
            row.get("Catalinadocumento", ""),
            row.get("Catalinacolegio", ""),
            row.get("Catalinaprofesor", ""),
            row.get("Catalinagrado", ""),
            row.get("Catalinamateria", ""),
            row.get("Catalinanota", "")
        ))

root = tk.Tk()
root.title("Gestión de Registros")

frame = ttk.Frame(root, padding="10")
frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))

tree = ttk.Treeview(frame, columns=("ID", "Usuario", "Documento", "Colegio", "Profesor", "Grado", "Materia", "Nota"))
tree.heading("#0", text="ID")
tree.heading("#1", text="Usuario")
tree.heading("#2", text="Documento")
tree.heading("#3", text="Colegio")
tree.heading("#4", text="Profesor")
tree.heading("#5", text="Grado")
tree.heading("#6", text="Materia")
tree.heading("#7", text="Nota")

for i in range(8):
    tree.column(f"#{i}", width=150)

tree.grid(row=0, column=0, columnspan=3, pady=10)

boton_agregar = ttk.Button(frame, text="Agregar Registro", command=agregar_registro)
boton_eliminar = ttk.Button(frame, text="Eliminar Registro", command=eliminar_registro)
boton_listar = ttk.Button(frame, text="Listar Registros", command=listar_registros)
boton_buscar = ttk.Button(frame, text="Buscar Registro", command=buscar_registro)
boton_actualizar = ttk.Button(frame, text="Actualizar Registro", command=actualizar_registro)

boton_agregar.grid(row=1, column=0, pady=10)
boton_eliminar.grid(row=1, column=1, pady=10)
boton_listar.grid(row=1, column=2, pady=10)
boton_buscar.grid(row=2, column=0, pady=10)
boton_actualizar.grid(row=2, column=1, pady=10)

root.mainloop()