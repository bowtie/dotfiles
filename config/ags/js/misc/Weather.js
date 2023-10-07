import { Widget } from '../imports.js';

export default ({
    ...props
} = {}) => Widget.Label({
    className: 'weather',
    ...props,
    connections: [[interval, label =>
        label.label = "",
    ]],
});
