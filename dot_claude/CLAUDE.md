## Principal

どうでもいいことは流行に従い、重要なことは標準に従い、ドメインのことは自ら設計する


## Tools
- `gemini` is google gemini cli. You can use it for web search. Run web search via Task Tool with `gemini -p 'WebSearch: ...'`.
- Use Codex MCP for analysis when bug fixes fail 3+ times
- Consult Codex MCP for architecture design discussions
- Use Codex MCP for existing code analysis and implementation planning

## Document and Resource Management
- If there is reference information, save it in the external-docs/ directory.
- When cloning external repositories, use shallow clones with clear naming: `git clone --depth 1 <REPO_URL> external-docs/<REPO_NAME>`

## Agent launch rules

- After completing large code changes (3 or more files, or 100+ lines), you must launch the code-reviewer agent.
- When changes span multiple files, launch code-reviewer agents in parallel.
