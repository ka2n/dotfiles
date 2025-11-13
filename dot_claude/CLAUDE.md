## Tools
- `gemini` is google gemini cli. You can use it for web search. Run web search via Task Tool with `gemini -p 'WebSearch: ...'`.
- Use Codex MCP for analysis when bug fixes fail 3+ times
- Consult Codex MCP for architecture design discussions
- Use Codex MCP for existing code analysis and implementation planning

## Document and Resource Management
- If there is reference information, save it in the external-docs/ directory.
- When cloning external repositories, use shallow clones with clear naming: `git clone --depth 1 <REPO_URL> external-docs/<REPO_NAME>`
