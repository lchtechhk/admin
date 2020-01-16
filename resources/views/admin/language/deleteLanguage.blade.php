<div class="modal fade" id="deleteLanguagesModal" tabindex="-1" role="dialog" aria-labelledby="deleteLanguagesModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="deleteLanguagesModalLabel">{{ trans('labels.DeleteLanguages') }}</h4>
        </div>
        {!! Form::open(array('url' =>'admin/deletelanguage', 'name'=>'deletelanguages', 'id'=>'deletelanguages', 'method'=>'post', 'class' => 'form-horizontal', 'enctype'=>'multipart/form-data')) !!}
                {!! Form::hidden('action',  'delete', array('class'=>'form-control')) !!}
                {!! Form::hidden('id',  '', array('class'=>'form-control', 'id'=>'languages_id')) !!}
        <div class="modal-body">						
            <p>{{ trans('labels.confrimLanguageDelete') }}</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">{{ trans('labels.Close') }}</button>
          <button type="submit" class="btn btn-primary" id="deletelanguages">{{ trans('labels.Delete') }}</button>
        </div>
        {!! Form::close() !!}
      </div>
    </div>
  </div>