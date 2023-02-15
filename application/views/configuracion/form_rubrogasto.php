<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">×</span></button>
      <h4 class="modal-title">Default Modal</h4>
    </div>
    <?= form_open(base_url().'configuracion/rubrogasto_guardar/'.$rubrogasto->id_rubrogasto) ?>
            <div class="modal-body">
                <div class="alert alert-danger error-message hidden" role="alert"></div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-12">
                            <label>Nombre del Rubro de Gasto:</label>
                            <?= form_input(array('name' => 'descripcion_rubrogasto', 'placeholder' => 'Ingrese el nombre de rubro de gasto (Ejem: Academico, Papeleria...)','class' => 'form-control', 'value' => $rubrogasto->descripcion_rubrogasto)) ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Guardar</button>
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancelar</button>
            </div>
        <?= form_close() ?>
  </div>
</div>
<script>
    $(function() {
        $('#cp2').colorpicker({
            format: "hex",
            colorSelectors: {
                'black': '#000000',
                'white': '#ffffff',
                'red': '#FF0000',
                'default': '#777777',
                'primary': '#337ab7',
                'success': '#5cb85c',
                'info': '#5bc0de',
                'warning': '#f0ad4e',
                'danger': '#d9534f'
            }
        });
    });
</script>