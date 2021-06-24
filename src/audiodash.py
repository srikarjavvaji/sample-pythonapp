import dash
import dash_html_components as html
from dash.dependencies import Input, Output
from dash.exceptions import PreventUpdate
from playsound import playsound


# playsound('keys-of-moon-the-success.mp3')
def soundnotify(n):
    if n is None:
        raise PreventUpdate
    else:
        print('sound {}'.format(n))
        playsound('Small-Indoor-crowd-applauding.mp3')
        
external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

app.layout = html.Div([
    html.Button('Play audio', id='show-secret'),
    html.Div(id='body-div')
])

@app.callback(
    Output(component_id='body-div', component_property='children'),
    Input(component_id='show-secret', component_property='n_clicks')
)
def update_output(n_clicks):
    if n_clicks is None:
        pass
    else:
        playsound('Small-Indoor-crowd-applauding.mp3')
    # return soundnotify(n_clicks)

if __name__ == '__main__':
    app.run_server()