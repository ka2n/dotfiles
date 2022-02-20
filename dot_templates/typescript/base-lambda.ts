import { IncomingMessage, ServerResponse } from 'http';

const handler = (_: IncomingMessage, res: ServerResponse) => {
    const example = {};

    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(
        JSON.stringify({
            data: example,
        })
    );
}

export default handler;
