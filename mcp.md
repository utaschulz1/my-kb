- Add ````.mcp.json``` file at root of project directory where you want to call the mcp server'S tools. It should contain somthing like this:
```json
{
  "mcpServers": {
    "mcp_dita-specs": {
      "type": "stdio",
      "command": "uv",
      "args": ["run", "python", "-u", "src/server.py"],
      "cwd": "/home/hpz440/projects/mcp_dita-specs"
    }
  }
}
```

========================================================================
## Get inspector running, test tools for real:
- The inspector is not a simulation, it is a GUI for your local mcp server and will run tools for real.
- Inspector works in TRANSPORT=sse (in .env)
- Start local mcp server first (remote servers are supposed to run anyway):
 ```bash
    uv run src/server.py
 ```
-> Runs on loacalhost:8051/sse (mind the /sse!)
- Then start Inspector
```
  npx @modelcontextprotocol/inspector
```
- Set transport and port in inspector and click "connect"
-> You should see navigation for tools and resources
 
- useful: `npx kill-port 6277` # kill last sessions port (or 6274)
- restart: `npx @modelcontextprotocol/inspector`
============================================================================
# TRANSPOR=stdio is for local mcp server, but it never worked for me

# Problem in stdio mode, when app (like crawl4ai) is printing [FETCH] log messages to stdout. In stdio mode, stdout is reserved exclusively for JSON-RPC protocol messages — anything else corrupts it.

# Redirect print() to stderr in stdio mode so crawl4ai logs don't corrupt the protocol
import sys
import builtins
if os.getenv("TRANSPORT", "stdio") == "stdio":
    _real_print = builtins.print
    def _stderr_print(*args, **kwargs):
        kwargs['file'] = sys.stderr
        _real_print(*args, **kwargs)
    builtins.print = _stderr_print
This intercepts print() calls (which crawl4ai uses for [FETCH] logs) and sends them to stderr, while sys.stdout stays intact for FastMCP's JSON-RPC messages.
=======================================================================
## Feed local file to mcp server
- in folder `python3 -m http.server 8080` or `npx http-server /path/to/project -o -p 9999`
- enter link in inpector/agent `http://localhost:8080/links.txt`

======================================================================
# Run remote mcp server like playwright
- in terminal in project folder -- not in Claude CLI !
```bash
  claude mcp add playwright npx @playwright/mcp@latest
```
- add to `.claude/settings.local.json`(note double underscore mcp__)
```json
  {
  "permissions": {
    "allow": ["mcp__playwright"],
    "deny": []
  }
  }
```
-> in a project that makes use of the browser you can now ask Claude to run the project files on localhost
===========================================================================================================

# Run debugging port when you want Claude to inspect the DOM
Terminal 1: serve the /public folder
`python3 -m http.server 8080 --directory`

Terminal 2: open Chromium with remote debuggin g for Claude to take screenshots
`chromium-browser --remote-debugging-port=9222 http://localhost:8080`
                                                                                                        
  