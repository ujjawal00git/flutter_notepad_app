from flask import Flask, request, jsonify
from flask_cors import CORS
import sys
import io

app = Flask(__name__)
CORS(app)  # Allow cross-origin requests

@app.route('/execute', methods=['POST'])
def execute_code():
    try:
        code = request.json.get("code", "")
        output = io.StringIO()
        sys.stdout = output
        exec(code)
        sys.stdout = sys.__stdout__
        return jsonify({"output": output.getvalue(), "error": None})
    except Exception as e:
        sys.stdout = sys.__stdout__
        return jsonify({"output": None, "error": str(e)})

if __name__ == '__main__':
    app.run(debug=True)
