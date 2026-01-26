import { useEffect, useState } from "react";

function App() {
  const [note, setNote] = useState("");
  const [notes, setNotes] = useState([]);

  // Load notes on page load
  useEffect(() => {
    loadNotes();
  }, []);

  async function loadNotes() {
    const res = await fetch("/api/notes");
    const data = await res.json();
    setNotes(data);
  }

  async function addNote() {
    if (!note.trim()) return;

    await fetch("/api/notes", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ note }),
    });

    setNote("");
    loadNotes();
  }

  return (
    <div style={styles.container}>
      <h1>📝 Notes App</h1>

      <div style={styles.inputBox}>
        <input
          value={note}
          onChange={(e) => setNote(e.target.value)}
          placeholder="Write a note..."
          style={styles.input}
        />
        <button onClick={addNote} style={styles.button}>
          Add
        </button>
      </div>

      <ul style={styles.list}>
        {notes.map((n, i) => (
          <li key={i} style={styles.item}>
            {n}
          </li>
        ))}
      </ul>
    </div>
  );
}

const styles = {
  container: {
    maxWidth: "500px",
    margin: "50px auto",
    fontFamily: "Arial",
  },
  inputBox: {
    display: "flex",
    gap: "10px",
  },
  input: {
    flex: 1,
    padding: "8px",
  },
  button: {
    padding: "8px 16px",
    cursor: "pointer",
  },
  list: {
    marginTop: "20px",
  },
  item: {
    background: "#f2f2f2",
    padding: "8px",
    marginBottom: "5px",
  },
};

export default App;
